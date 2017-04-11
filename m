From: Juergen Schindele <schindele@nentec.de>
Subject: Re: Switching off LED triggers udev
Date: Tue, 11 Apr 2017 09:25:45 +0200
Message-ID: <12863417.iDUGhS21ch@sherry>
References: <1803981.yiQbQ3iWBI@sherry> <c44f614e-d430-e045-fb90-f2654211b9a6@gmail.com>
Reply-To: schindele@nentec.de
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from gate.nentec.de ([213.218.23.37]:53684 "HELO dmz-mail.nentec.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
        id S1753725AbdDKHZv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Apr 2017 03:25:51 -0400
In-Reply-To: <c44f614e-d430-e045-fb90-f2654211b9a6@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

Am Montag, 10. April 2017, 20:42:23 schrieben Sie:
Hello Jacek,
that is a good hint. Yes the effect is the same and it works great too
for me. I was not looking to the most recent kernel sorry.
Thank you for your help
> Hi Juergen.
> 
> On 04/10/2017 04:29 PM, Juergen Schindele wrote:
> > Hello List,
> > i hope i found the right addres for this small problem.
> > I have a userspace daemon which controls leds via sysfs API
> > "/sys/class/leds/Soft1/brightness". Each time i turn the LED off
> > by writing 0 to brightness the /proc/sys/kernel/hotplug deamon
> > is called with "ACTION:change SUBSYSTEM:leds DEVNAME:(null)
> > DEVPATH:/devices/...."
> > 
> > from led-class.c ----------------------------
> > 
> >         if (state == LED_OFF)
> >         
> >                 led_trigger_remove(led_cdev);
> >         
> >         __led_set_brightness(led_cdev, state);
> > 
> > But in fact there is no change of trigger because "none" was setup between
> > enabling LED and disabling it. So from my point of view there is no change
> > from "none" to "remove" which justifies a
> > "kobject_uevent_env(&led_cdev->dev-> 
> >> kobj, KOBJ_CHANGE, envp)".
> > 
> > To solve this problem of unusefull waste of CPU-time i suggest the
> > following patch. Please consider the implementation which saved a lot of
> > valuable CPU- power in my case:
> > 
> > Index: drivers/leds/led-triggers.c
> > ===================================================================
> > --- drivers/leds/led-triggers.c (Revision 14968)
> > +++ drivers/leds/led-triggers.c (Arbeitskopie)
> > @@ -106,10 +106,11 @@
> > 
> >         const char *name;
> >         
> >         name = trig ? trig->name : "none";
> > 
> > -       event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
> > 
> >         /* Remove any existing trigger */
> >         if (led_cdev->trigger) {
> > 
> > +               event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
> > +
> > 
> >                 write_lock_irqsave(&led_cdev->trigger->leddev_list_lock,
> > 
> > flags);
> > 
> >                 list_del(&led_cdev->trig_list);
> >                 write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lo
> >                 ck,
> > 
> > @@ -122,6 +123,8 @@
> > 
> >                 led_set_brightness(led_cdev, LED_OFF);
> >         
> >         }
> >         if (trig) {
> > 
> > +               event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);
> > +
> > 
> >                 write_lock_irqsave(&trig->leddev_list_lock, flags);
> >                 list_add_tail(&led_cdev->trig_list, &trig->led_cdevs);
> >                 write_unlock_irqrestore(&trig->leddev_list_lock, flags);
> > 
> > Thank you for your attention
> 
> In 4.9 we have the following patch that should fix your problem,
> please let us know if it works for you:
> 
> commit fbfa197afddd13f9bdca1c822f5d5730b50639eb
> Author: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Date:   Sun Sep 18 20:24:29 2016 +0200
> 
>     leds: triggers: Return from led_trigger_set() if there is nothing to do
> 
>     If led_trigger_set() is called with "trig" argument set to NULL, and
> there
>     is no trigger to remove then the function should return immediately so
>     as to avoid doing unnecessary allocation and sending uevent.
> 
>     Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>     Reported-by: Daniel Romell <daro@hms.se>
>     Acked-by Daniel Romell <daro@hms.se>
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 59d6a3e..c7a38d4 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -110,6 +110,9 @@ void led_trigger_set(struct led_classdev *led_cdev,
> struct led_trigger *trig)
>         char *envp[2];
>         const char *name;
> 
> +       if (!led_cdev->trigger && !trig)
> +               return;
> +
>         name = trig ? trig->name : "none";
>         event = kasprintf(GFP_KERNEL, "TRIGGER=%s", name);

-- 
i. A.
Jürgen Schindele
Softwareentwicklung

PSI Nentec GmbH
Greschbachstraße 12
76229 Karlsruhe
Deutschland
Telefon: +49 721 94249-51
Telefax: +49 721 94249-10
schindele@nentec.de
www.nentec.de

Geschäftsführung: Klaus Becker, Wolfgang Fischer
Sitz der Gesellschaft: Karlsruhe
Handelsregister: Amtsgericht Mannheim HRB 107658

Diese E-Mail enthält vertrauliche oder rechtlich geschützte Informationen. 
Wenn Sie nicht der vorgesehene Empfänger sind, informieren Sie bitte sofort 
den Absender und löschen Sie diese E-Mail. Das unbefugte Kopieren dieser E-
Mail oder die unbefugte Weitergabe der enthaltenen Informationen ist nicht 
gestattet.

The information contained in this message is confidential or protected by law. 
If you are not the intended recipient, please contact the sender and delete 
this message. Any unauthorised copying of this message or unauthorised 
distribution of the information contained herein is prohibited. 
