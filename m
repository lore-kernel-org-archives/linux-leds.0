From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Fri, 1 Dec 2017 07:56:13 +0000
Message-ID: <20171201075613.vvwvrkl73pd7rg62@dell>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <20171130082940.5mzslaxv53dlu3t2@dell>
 <20171130083131.kjgehcutqsbkjxr5@dell>
 <661e011e-d7d2-4947-6648-8e76e3426aaa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <661e011e-d7d2-4947-6648-8e76e3426aaa@gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, 30 Nov 2017, Jacek Anaszewski wrote:

> On 11/30/2017 09:31 AM, Lee Jones wrote:
> > On Thu, 30 Nov 2017, Lee Jones wrote:
> > 
> >> On Wed, 29 Nov 2017, Bjorn Andersson wrote:
> >>
> >>> The pointer returned by of_device_get_match_data() doesn't have the same
> >>> size as u32 on 64-bit architectures, causing issues when compile testing
> >>> the driver on such platform. Make ledtype unsigned long instead, to
> >>> solve this problem.
> >>>
> >>> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> >>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> ---
> >>>  drivers/leds/leds-pm8058.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> Hi Bjorn,
> >>
> >> (Nice to see you) :)
> >>
> >> I'm going to apply this *before* Linus' fix.
> >>
> >> Applied, thanks.
> > 
> > After I rx an Ack from Richard, Jacek or Pavel of course. :)
> > 
> > Will send a pull-request.
> 
> Huh? This is for LED subsystem AFAICS.

Right, hence why I said I'd sent out a pull-request.

The problem, however, arose due to a change in its parent driver's
Kconfig entry, which has been applied to the MFD tree.  We need to
ensure this patch is applied *before* the other 'fix' to quash the
warning before it starts, so to speak.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
