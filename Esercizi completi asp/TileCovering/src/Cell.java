import it.unical.mat.embasp.languages.Id;
import it.unical.mat.embasp.languages.Param;

@Id("cell")
public class Cell {

        @Param(0)
        private int row;
        @Param(1)
        private int column;
        @Param(2)
        private int tile;

        public Cell(int r,int c, int t){
            this.row=r;
            this.column=c;
            this.tile=t;


        }

        public Cell() {
        }

        public int getRow() {
            return row;
        }

        public void setRow(int row) {
            this.row = row;
        }

        public int getColumn() {
            return column;
        }

        public void setColumn(int column) {
            this.column = column;
        }


        public int getTile() {
            return tile;
        }

        public void setTile(int tile) {
            this.tile = tile;
        }

}
