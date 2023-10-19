
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class SoundConcert : UdonSharpBehaviour

{
   
public AudioSource Bubble;
public AudioSource firework;
public AudioSource kolba;
public AudioSource krylya;
 public AudioSource teleport;
  public AudioSource ufo;
   public AudioSource vihr;

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

}

