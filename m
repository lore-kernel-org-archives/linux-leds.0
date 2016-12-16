From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 10:59:06 +0100
Message-ID: <20161216095906.GS13946@wotan.suse.de>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161216092919.GA26091@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaur
List-Id: linux-leds@vger.kernel.org

On Fri, Dec 16, 2016 at 10:29:20AM +0100, Pavel Machek wrote:
> On Fri 2016-12-16 10:22:41, Luis R. Rodriguez wrote:
> > On Tue, Dec 13, 2016 at 08:04:29PM +0100, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > We need to ensure that when driver developers use the custom firmware
> > > > fallback mechanism it was not a copy and paste bug. These use cases on
> > > > upstream drivers are rare, we only have 2 upstream users and its for
> > > > really old drivers. Since valid uses are rare but possible enable a
> > > > white-list for its use, and use this same white-list annotation to refer
> > > > to the documentation covering the custom use case.
> > > 
> > > > --- a/drivers/leds/leds-lp55xx-common.c
> > > > +++ b/drivers/leds/leds-lp55xx-common.c
> > > > @@ -219,6 +219,7 @@ static void lp55xx_firmware_loaded(const struct firmware *fw, void *context)
> > > >  	release_firmware(chip->fw);
> > > >  }
> > > >  
> > > > +DECLARE_FW_CUSTOM_FALLBACK("Documentation/leds/leds-lp55xx.txt");
> > > >  static int lp55xx_request_firmware(struct lp55xx_chip *chip)
> > > >  {
> > > >  	const char *name = chip->cl->name;
> > > 
> > > The driver does:
> > > 
> > > static void lp55xx_firmware_loaded(const struct firmware *fw, void
> > > *context)
> > > {
> > > 	struct lp55xx_chip *chip = context;
> > > 	        struct device *dev = &chip->cl->dev;
> > > 		        enum lp55xx_engine_index idx =
> > > 			chip->engine_idx;
> > > 
> > >         if (!fw) {
> > > 	                dev_err(dev, "firmware request failed\n");
> > > 			                goto out;
> > > 					     }
> > >         ...
> > > out:
> > >         /* firmware should be released for other channel use */
> > > 	        release_firmware(chip->fw);
> > > }
> > > 
> > > 
> > > Does that match the "custom fallback" definition?
> > 
> > Refer to the documentation I supplied, and also to the grammar rule, in
> > particular the patch "firmware: add SmPL report for custom fallback mechanism",
> > it captures the SmPL form for the custom fallback mechanism as:
> 
> I don't much care what the rule says. If you believe the code is
> buggy, submit a patch.

Huh? No, its an old API and valid uses are scarce. The point is to avoid folks
adding yet other users by mistake by using grammar to help white-list actual
valid users.

  Luis
