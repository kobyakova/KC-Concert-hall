
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
   


   void Update(
   )
   {

   }

    public void play_bubble()
    {
    Bubble.Stop();
        Bubble.Play();
    }

    public void play_firework()
    {
     firework.Stop();
        firework.Play();
    }
    public void play_kolba()
    {
    kolba.Stop();
        kolba.Play();
    }
    public void play_krylya()
    {
      krylya.Stop();
        krylya.Play();
    }
    public void play_teleport()
    {
        teleport.Stop();
    teleport.Play();
    }
    public void play_ufo()
    {
    ufo.Stop();
        ufo.Play();
    }
    public void play_vihr()
    {
            vihr.Stop();
        vihr.Play();
    }
        public void play_putkolba()
    {
    putkolba.Stop();
        putkolba.Play();
    }

          public void play_build()
    {
        build.Stop();
        build.Play();
    }
    public void play_wow()
    { 
    wow.Stop();
        wow.Play();
    }
    public void play_flash()
    {
     flash.Stop();
        flash.Play();
    }
    public void stop_all()
    {
     Bubble.Stop();
      firework.Stop();
        kolba.Stop();
        putkolba.Stop();
        teleport.Stop();
          ufo.Stop();
vihr.Stop();
      wow.Stop();
       flash.Stop();

    }
}

