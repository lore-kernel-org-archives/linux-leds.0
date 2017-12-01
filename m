From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] leds: pm8058: Silence pointer to integer size warning
Date: Fri, 1 Dec 2017 08:56:01 +0000
Message-ID: <20171201085601.ielbzvwbbxkmgl27@dell>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171201051656.31694-1-bjorn.andersson@linaro.org>
 <20171201075715.2bkjpjfqbitz2bem@dell>
 <20171201083642.GA4960@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201083642.GA4960@amd>
Sender: linux-next-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, 01 Dec 2017, Pavel Machek wrote:

> On Fri 2017-12-01 07:57:15, Lee Jones wrote:
> > On Thu, 30 Nov 2017, Bjorn Andersson wrote:
> > > -	led->ledtype = (u32)of_device_get_match_data(&pdev->dev);
> > > +	led->ledtype = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);
> > 
> > Wouldn't (u32)(void *) be even more correct?
> > 
> > ... if the compiler will let you get away with it.
> 
> Afaict that would still produce the warning. of_device_get_match_data
> already returns void *.

Just tested.  It actually still suffers from the original error.

warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
