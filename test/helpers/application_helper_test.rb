class ApplicationHelperTest < ActionView::TestCase
  test "should return primary" do
    assert_dom_equal %{primary}, bootstrop_context_label_for('notice')
  end

  test "should return alert" do
    assert_dom_equal %{danger}, bootstrop_context_label_for('alert')
  end
end
