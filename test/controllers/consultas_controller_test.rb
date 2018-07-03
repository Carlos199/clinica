require 'test_helper'

class ConsultasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consulta = consultas(:one)
  end

  test "should get index" do
    get consultas_url
    assert_response :success
  end

  test "should get new" do
    get new_consulta_url
    assert_response :success
  end

  test "should create consulta" do
    assert_difference('Consulta.count') do
      post consultas_url, params: { consulta: { data: @consulta.data, medico_id: @consulta.medico_id, nome_plano: @consulta.nome_plano, paciente_id: @consulta.paciente_id, preco: @consulta.preco, tipo_consula: @consulta.tipo_consula, tipo_plano: @consulta.tipo_plano } }
    end

    assert_redirected_to consulta_url(Consulta.last)
  end

  test "should show consulta" do
    get consulta_url(@consulta)
    assert_response :success
  end

  test "should get edit" do
    get edit_consulta_url(@consulta)
    assert_response :success
  end

  test "should update consulta" do
    patch consulta_url(@consulta), params: { consulta: { data: @consulta.data, medico_id: @consulta.medico_id, nome_plano: @consulta.nome_plano, paciente_id: @consulta.paciente_id, preco: @consulta.preco, tipo_consula: @consulta.tipo_consula, tipo_plano: @consulta.tipo_plano } }
    assert_redirected_to consulta_url(@consulta)
  end

  test "should destroy consulta" do
    assert_difference('Consulta.count', -1) do
      delete consulta_url(@consulta)
    end

    assert_redirected_to consultas_url
  end
end
