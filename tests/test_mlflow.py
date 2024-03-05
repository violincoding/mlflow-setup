import numpy as np
from sklearn.linear_model import LogisticRegression

import mlflow
import mlflow.sklearn
from mlflow.models import infer_signature

mlflow.set_tracking_uri("http://localhost:5001")

if __name__ == "__main__":
    with mlflow.start_run():
        X = np.array([-2, -1, 0, 1, 2, 1]).reshape(-1, 1)
        y = np.array([0, 0, 1, 1, 1, 0])
        lr = LogisticRegression()
        lr.fit(X, y)
        score = lr.score(X, y)
        print(f"Score: {score}")
        mlflow.log_metric("score", score)
        predictions = lr.predict(X)
        signature = infer_signature(X, predictions)
        mlflow.sklearn.log_model(lr, "model", signature=signature)
        print(f"Model saved in run {mlflow.active_run().info.run_uuid}")
