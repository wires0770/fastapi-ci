from fastapi import APIRouter

router = APIRouter(prefix="/common", tags=["common"])


@router.get("/healthcheck")
def healthcheck() -> dict[str, str]:
    return {"status": "ok"}
