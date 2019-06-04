From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Tue, 4 Jun 2019 10:14:42 -0500
Message-ID: <f9ad6600-3060-65c5-6f87-8a167c75f8b0@ti.com>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
 <20190529151000.GP2456@sirena.org.uk>
 <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
 <20190530152643.GS2456@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530152643.GS2456@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Mark

On 5/30/19 10:26 AM, Mark Brown wrote:
>
> That code is rather far away from the code you're changing and it's
> really not clear that this will do the right thing for new devices, it
> already appears that we're handling two devices without obvious code for
> that (the regulator IDs get reused AFAICT).  If there were a switch
> statement right there it'd be clearer.
>
> Part of this is a reviewability thing - I initially stopped on the patch
> because it looked like it was using the enable field for something other
> than the intended purpose and now there's all this chasing around to see
> if the code is OK.

I am going to introduce this update in patch 4 of this series when the 
LM36274 is introduced to the regulator driver.

It makes more sense to add it there as in patch 1 there is not really a 
need to extend the value or mask as it only supports the LM3632 device.  
It makes sense to add the condition when adding another device to support

Thoughts?

Dan
