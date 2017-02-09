From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 3/4] leds: Add LED support for MT6323 PMIC
Date: Thu, 9 Feb 2017 15:23:44 +0100
Message-ID: <20170209142344.GA23373@xo-6d-61-c0.localdomain>
References: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
 <1486520357-13096-4-git-send-email-sean.wang@mediatek.com>
 <a410da2e-ce5f-6263-2d7d-79f4b358a848@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <a410da2e-ce5f-6263-2d7d-79f4b358a848@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, keyhaede@gmail.com, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, rpurdie@rpsys.net, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> > +/*
> > + * Register for MT6323_ISINK_CON0 to setup the
> > + * duty cycle of the blink
> > + */
> > +#define MT6323_ISINK_CON0(i)		(MT6323_ISINK0_CON0 + 0x8 * (i))
> > +#define MT6323_ISINK_DIM_DUTY_MASK	(0x1f << 8)
> > +#define MT6323_ISINK_DIM_DUTY(i)	(((i) << 8) & \
> > +					MT6323_ISINK_DIM_DUTY_MASK)
> > +
> > +/*
> > + * Register to setup the period of the blink
> > + */
> 
> This fits in a single line, so can be wrapped with /* */ like :

People do this to make blocks stand out, and to make it similar to other blocks
above. I believe this is ok.

									Pavel
