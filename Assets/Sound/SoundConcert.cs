
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class SoundConcert : UdonSharpBehaviour

{
   
public AudioSource Bubble;
public AudioSource firework;
public AudioSource kolba;
public AudioSource putkolba;
public AudioSource krylya;
 public AudioSource teleport;
 public AudioSource ufo;
 public AudioSource vihr;
 public AudioSource build;
  public AudioSource wow;
   public AudioSource flash;

    public void play_bubble()
    {
        Bubble.Play();
    }

    public void play_firework()
    {
        firework.Play();
    }
    public void play_kolba()
    {
        kolba.Play();
    }
    public void play_krylya()
    {
        krylya.Play();
    }
    public void play_teleport()
    {
        teleport.Play();
    }
    public void play_ufo()
    {
        ufo.Play();
    }
    public void play_vihr()
    {
        vihr.Play();
    }
        public void play_putkolba()
    {
        putkolba.Play();
    }

          public void play_build()
    {
        build.Play();
    }
    public void play_wow()
    {
        wow.Play();
    }
    public void play_flash()
    {
        flash.Play();
    }
}

