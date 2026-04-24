
package com.shopsmar.model;

import java.io.IOException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LectorDatos {
    private Scanner entrada;

    public LectorDatos() {
        this.entrada = new Scanner(System.in);
    }
    
    public double leerDouble(String mensaje, String patronAVerificar, String mensajeError){
        String num;
        double numDouble;
        boolean esValido = false;
        do{
            System.out.println(mensaje);
            num = entrada.nextLine();
            esValido = validarString(num, patronAVerificar); // Regex para un String que contenga double positivo
            
            if(!esValido){
                System.out.println(mensajeError);
            }
        }while(esValido == false);
        numDouble = Double.parseDouble(num);
        return numDouble;
    }
    
    public int leerEntero(String mensaje, String patronAVerificar, String mensajeError){
        String num;
        int numeroEntero;
        boolean esValido = false;
        do{
            System.out.println(mensaje);
            num = entrada.nextLine();
            esValido = validarString(num, patronAVerificar); // Regex para un String que contenga double positivo
            
            if(!esValido){
                System.out.println(mensajeError);
            }
        }while(esValido == false);
        numeroEntero = Integer.parseInt(num);
        return numeroEntero;
    }
    
    public String leerString(String mensaje, String patron, String mensajeError){
        String cadena;
        boolean esValido = false;
        do{
            System.out.println(mensaje);
            cadena = entrada.nextLine();
            esValido = validarString(cadena, patron);
            if(!esValido){
                System.out.println(mensajeError);
            }
        }while(esValido == false);
        return cadena;
    }
    
    public String leerString(String mensaje, String opciones[], String mensajeError){
        String cadena;
        boolean esValido = false;
        do{
            System.out.println(mensaje);
            cadena = entrada.nextLine();
            for(String cad: opciones){
                if(cad.equalsIgnoreCase(cadena)){
                    esValido = true;
                }
            }
            if(!esValido){
                System.out.println(mensajeError);
            }
        }while(!esValido);
        return cadena;
    }
    
    public String leerString(String mensaje){
        System.out.println(mensaje);
        return entrada.nextLine();
    }
    
    public int leerOpcion(String mensaje, int opciones[]){
        int opc;
        boolean opcionValida = false;
        do{
            System.out.println(mensaje);
            opc = entrada.nextInt();
            limpiarBuffer();
            for(int i = 0; i<opciones.length; i++){
                if(opciones[i] == opc){
                    opcionValida = true;
                }
            }
            if(opcionValida == false){
                System.out.println("ERROR. Digite una opcion valida");
            }
        }while(opcionValida == false);
        return opc;
    }
    
    private boolean validarString(String cadena, String patronAVerificar){
        Pattern patron = Pattern.compile(patronAVerificar);
        Matcher mat = patron.matcher(cadena);
        return mat.matches();
    }
    
    public void limpiarBuffer(){
        entrada.nextLine();
    }
    
    public void hacerPausa() throws IOException{
        System.out.println("Pulse cualquier tecla para continuar...");
        System.in.read();
    }
    
    public void limpiarPantalla() throws IOException, InterruptedException{
        new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
    }
    
    public void cerrarScanner(){
        entrada.close();
    }
}
