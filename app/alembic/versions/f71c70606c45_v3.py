"""v3

Revision ID: f71c70606c45
Revises: 75eed3fe1a0f
Create Date: 2025-01-02 05:00:03.873032

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'f71c70606c45'
down_revision: Union[str, None] = '75eed3fe1a0f'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('choices', sa.Column('true_answer', sa.String(), nullable=False))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('choices', 'true_answer')
    # ### end Alembic commands ###
