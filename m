From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC LEDs
Date: Tue, 12 Feb 2019 23:25:45 +0300
Message-ID: <20190212202545.GD5213@jeknote.loshitsa1.net>
References: <20190209221213.24052-1-jekhor@gmail.com>
 <20190209221213.24052-2-jekhor@gmail.com>
 <20190211131726.GA11067@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190211131726.GA11067@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Feb 11, 2019 at 02:17:26PM +0100, Pavel Machek wrote:
> Hi!
> 
> > +static struct cht_wc_led cht_wc_leds[] = {
> > +	{
> > +		.name = "pmic::charge",
> > +		.ctrl_reg = CHT_WC_LED1_CTRL,
> > +		.fsm_reg = CHT_WC_LED1_FSM,
> > +		.pwm_reg = CHT_WC_LED1_PWM,
> > +		.enable_mask = CHT_WC_LED1_ON,
> > +	},
> > +	{
> > +		.name = "pmic::gpled",
> > +		.ctrl_reg = CHT_WC_LED2_CTRL,
> > +		.fsm_reg = CHT_WC_LED2_FSM,
> > +		.pwm_reg = CHT_WC_LED2_PWM,
> > +		.enable_mask = CHT_WC_LED2_ON,
> > +	},
> > +};
> 
> Unfortunately, these LED names will not be too useful for
> userspace. What about "platform::charging" and "status-led::"?

That sounds reasonable.

> 
> Should we have some default triggers?

I don't know which triggers may be suitable for this. There are no
generic "is charging now" triggers in kernel. I can set default trigger
of charging led to 'bq27542-0-charging-blink-full-solid' as example but
it will valid for platforms with bq27542 battery fuel gauge, of course.

For status led, 'default-on' should be reasonable.

> 								Pavel

-- 
Yauhen Kharuzhy
