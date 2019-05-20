From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 08/10] dt: fix refs that were renamed to json with the
 same file name
Date: Mon, 20 May 2019 13:13:44 -0300
Message-ID: <20190520131344.39635733@coco.lan>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
        <66231286de0f11b45075292216a939858de8c3e5.1558362030.git.mchehab+samsung@kernel.org>
        <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKGzNBjxhvY2Vq9v8SXiND+7sjmsOwKkeu+gEM=2Y-n_A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, devicetree@
List-Id: linux-leds@vger.kernel.org

Em Mon, 20 May 2019 10:57:47 -0500
Rob Herring <robh+dt@kernel.org> escreveu:

> On Mon, May 20, 2019 at 9:48 AM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> >
> > This file was converted to json, but the references weren't  
> 
> Technically, converted to json-schema (the language) or yaml (the format).

Ok. Do you want me to change it at the patch and resend?

> 
> > renamed.
> >
> > Fixes: 66ed144f147a ("dt-bindings: interrupt-controller: Convert ARM GIC to json-schema")
> > (and other similar commits)
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/omap/crossbar.txt       | 2 +-
> >  .../devicetree/bindings/clock/samsung,s5pv210-clock.txt       | 2 +-
> >  .../bindings/interrupt-controller/marvell,odmi-controller.txt | 2 +-
> >  Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt   | 2 +-
> >  MAINTAINERS                                                   | 4 ++--
> >  5 files changed, 6 insertions(+), 6 deletions(-)  
> 
> FYI, I'm actively looking for this in conversions now as we've had a
> few of these. For cases where we have a lot of references, I'm fixing
> this by keeping the .txt file with a reference to the .yaml file.

If the file name remains with the same name, except for the .txt -> .yaml,
you can just run the "scripts/documentation-file-ref-check --fix"
after this patch:

	Subject: [PATCH 04/10] scripts/documentation-file-ref-check: teach about .txt -> .yaml renames

and it should detect and automatically fix all the references. As any
auto-hint script, you need to double-check the results.

> I'll pick up the DT patches in the series.

OK. There are a few such fixes inside patch 10/10. Do you want me
to split it or can it go through Jonathan's doc tree?

Thanks,
Mauro
