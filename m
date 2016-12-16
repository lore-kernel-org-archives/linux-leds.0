From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 10:26:09 +0100
Message-ID: <20161216092609.GP13946@wotan.suse.de>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <6ad65e16-18c6-83c5-72db-053abc909ef8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37462 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760317AbcLPJ0N (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Dec 2016 04:26:13 -0500
Content-Disposition: inline
In-Reply-To: <6ad65e16-18c6-83c5-72db-053abc909ef8@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaur

On Thu, Dec 15, 2016 at 10:32:12AM +0100, Jacek Anaszewski wrote:
> > diff --git a/Documentation/driver-api/firmware/fallback-mechanisms.rst b/Documentation/driver-api/firmware/fallback-mechanisms.rst
> > index 955c11d6ff9d..b51673e40439 100644
> > --- a/Documentation/driver-api/firmware/fallback-mechanisms.rst
> > +++ b/Documentation/driver-api/firmware/fallback-mechanisms.rst
> > @@ -184,8 +184,11 @@ load firmware for you through a custom path.
> > 
> >  The custom fallback mechanism can often be enabled by mistake. We currently
> >  have only 2 users of it, and little justification to enable it for other users.
> > -Since it is a common driver developer mistake to enable it, help police for
> > -new users of the custom fallback mechanism with::
> > +Since it is a common driver developer mistake to enable it, driver developers
> > +should use DECLARE_FW_CUSTOM_FALLBACK() to both white-list and validate their
> > +use and also refer to the documentation for the custom loading solution.
> > +
> > +Invalid users of the custom fallback mechanism can be policed using::
> 
> double colon at the end of line

That is on purpose for rst files, for use with the new trendy hipster
Sphinx documentation format.

> > 
> >          $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
> >          $ make coccicheck MODE=report

It will kind of blockquote the above.

> > diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> > index 5377f22ff994..04161428ee3b 100644
> > --- a/drivers/leds/leds-lp55xx-common.c
> > +++ b/drivers/leds/leds-lp55xx-common.c
> > @@ -219,6 +219,7 @@ static void lp55xx_firmware_loaded(const struct firmware *fw, void *context)
> >  	release_firmware(chip->fw);
> >  }
> > 
> > +DECLARE_FW_CUSTOM_FALLBACK("Documentation/leds/leds-lp55xx.txt");
> >  static int lp55xx_request_firmware(struct lp55xx_chip *chip)
> >  {
> 
> For this LED class driver:
> 
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Thanks, amended!

  Luis
