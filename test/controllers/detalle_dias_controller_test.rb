require 'test_helper'

class DetalleDiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_dia = detalle_dias(:one)
  end

  test "should get index" do
    get detalle_dias_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_dia_url
    assert_response :success
  end

  test "should create detalle_dia" do
    assert_difference('DetalleDia.count') do
      post detalle_dias_url, params: { detalle_dia: { horafin: @detalle_dia.horafin, horaini: @detalle_dia.horaini } }
    end

    assert_redirected_to detalle_dia_url(DetalleDia.last)
  end

  test "should show detalle_dia" do
    get detalle_dia_url(@detalle_dia)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_dia_url(@detalle_dia)
    assert_response :success
  end

  test "should update detalle_dia" do
    patch detalle_dia_url(@detalle_dia), params: { detalle_dia: { horafin: @detalle_dia.horafin, horaini: @detalle_dia.horaini } }
    assert_redirected_to detalle_dia_url(@detalle_dia)
  end

  test "should destroy detalle_dia" do
    assert_difference('DetalleDia.count', -1) do
      delete detalle_dia_url(@detalle_dia)
    end

    assert_redirected_to detalle_dias_url
  end
end
