class ApplicationHelperTest < ActionView::TestCase
  test "should return success for notice" do
    assert_dom_equal %{success}, bootstrop_context_label_for('notice')
  end

  test "should return danger for alert" do
    assert_dom_equal %{danger}, bootstrop_context_label_for('alert')
  end
end
