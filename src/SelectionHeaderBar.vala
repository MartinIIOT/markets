[GtkTemplate (ui = "/com/bitstower/Markets/SelectionHeaderBar.ui")]
public class Markets.SelectionHeaderBar : Hdy.HeaderBar {

	[GtkChild]
	Gtk.Button deleteBtn;

    private Markets.State state;

    public SelectionHeaderBar (Markets.State state) {
        Object ();

        this.state = state;

        this.state.notify["totalSelected"].connect (this.onTotalSelectedUpdated);

        this.onTotalSelectedUpdated ();
    }

    [GtkCallback]
    private void onCancelClicked () {
        this.state.viewMode = Markets.ViewMode.PRESENTATION;
    }

    private void onTotalSelectedUpdated () {
        this.deleteBtn.sensitive = this.state.totalSelected > 0;

    }
}