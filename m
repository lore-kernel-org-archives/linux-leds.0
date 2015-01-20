From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v10 07/19] mfd: max77693: Adjust FLASH_EN_SHIFT and
 TORCH_EN_SHIFT macros
Date: Tue, 20 Jan 2015 16:41:00 +0000
Message-ID: <20150120164100.GE30656@x1>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-8-git-send-email-j.anaszewski@samsung.com>
 <20150120111719.GF13701@x1>
 <54BE51B2.8040209@samsung.com>
 <54BE6228.5070304@samsung.com>
 <20150120154029.GC13701@x1>
 <20150120160056.GA32144@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150120160056.GA32144@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-leds@vger.kernel.org

On Tue, 20 Jan 2015, Pavel Machek wrote:
> On Tue 2015-01-20 15:40:29, Lee Jones wrote:
> > On Tue, 20 Jan 2015, Jacek Anaszewski wrote:
> >=20
> > > On 01/20/2015 02:01 PM, Jacek Anaszewski wrote:
> > > >On 01/20/2015 12:17 PM, Lee Jones wrote:
> > > >>On Fri, 09 Jan 2015, Jacek Anaszewski wrote:
> > > >>
> > > >>>Modify FLASH_EN_SHIFT and TORCH_EN_SHIFT macros to work proper=
ly
> > > >>>when passed enum max77693_fled values (0 for FLED1 and 1 for F=
LED2)
> > > >>>from leds-max77693 driver.
> > > >>
> > > >>Off-by-one ay?  Wasn't the original code tested?
> > > >
> > > >The driver using these macros is a part of LED / flash API integ=
ration
> > > >patch series, which still undergoes modifications and it hasn't
> > > >reached its final state yet, as there are many things to discuss=
=2E
> > >=20
> > > To be more precise: the original code had been tested and was wor=
king
> > > properly with the header that is in the mainline. Nonetheless, be=
cause
> > > of the modifications in the driver that was requested during code
> > > review, it turned out that it would be more convenient to redefin=
e the
> > > macros.
> > >=20
> > > I'd opt for just agreeing about the mfd related patches and merge
> > > them no sooner than the leds-max77693 driver is merged.
> >=20
> > The only way we can guarantee this is to have them go in during
> > different merge-windows, unless of course they go in via the same t=
ree.
>=20
> Umm. Maintainers should be able to coordinate that. Delaying patch fo=
r
> one major release seems rather cruel. Perhaps one maintainer should
> ack the patch and the second one should merge it...

Wow, you're just everywhere today. :)

Read the part after the comma again.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
