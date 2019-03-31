From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] leds: fix a potential NULL pointer dereference
Date: Sun, 31 Mar 2019 11:06:05 +0200
Message-ID: <CAMuHMdXELu2tcSB5C1yKUGft6sDGPAy997ApPzy17n0MssfyWA@mail.gmail.com>
References: <20190309060411.29074-1-kjlu@umn.edu> <8c616b91-8f0d-f53b-af10-4d768063c5a0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8c616b91-8f0d-f53b-af10-4d768063c5a0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Kangjie Lu <kjlu@umn.edu>, pakki001@umn.edu, Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Sun, Mar 10, 2019 at 9:40 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> On 3/9/19 7:04 AM, Kangjie Lu wrote:
> > In case of_match_device cannot find a match, the fixes returns
> > -EINVAL to avoid NULL pointer dereference.
> >
> > Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> > ---
> >   drivers/leds/leds-pca9532.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> > index 7fea18b0c15d..4b0335591728 100644
> > --- a/drivers/leds/leds-pca9532.c
> > +++ b/drivers/leds/leds-pca9532.c
> > @@ -513,6 +513,7 @@ static int pca9532_probe(struct i2c_client *client,
> >       const struct i2c_device_id *id)
> >   {
> >       int devid;
> > +     const struct of_device_id *of_id;
> >       struct pca9532_data *data = i2c_get_clientdata(client);
> >       struct pca9532_platform_data *pca9532_pdata =
> >                       dev_get_platdata(&client->dev);
> > @@ -528,8 +529,11 @@ static int pca9532_probe(struct i2c_client *client,
> >                       dev_err(&client->dev, "no platform data\n");
> >                       return -EINVAL;
> >               }
> > -             devid = (int)(uintptr_t)of_match_device(
> > -                     of_pca9532_leds_match, &client->dev)->data;
> > +             of_id = of_match_device(of_pca9532_leds_match,
> > +                             &client->dev);
> > +             if (unlikely(!of_id))

Use of unlikey() is frowned upon.
Moreover, this cannot happen, as pca9532_of_populate_pdata() already
contains a similar check.

Kangjie: please stop submitting patches for missing checks, without
investigating if the failures can actually happen. Thanks!

> > +                     return -EINVAL;
> > +             devid = (int)of_id->data;
> >       } else {
> >               devid = id->driver_data;
> >       }
>
>
> Applied to the for-5.2 branch of linux-leds.git.

And also as a fix for v5.1...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
