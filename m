From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/2] leds: add Panasonic AN30259A support
Date: Fri, 27 Jul 2018 22:22:36 +0200
Message-ID: <341157fb-257d-8984-c8d3-0e4a51c4479e@gmail.com>
References: <20180721141228.2283-1-simon@lineageos.org>
 <20180721141228.2283-3-simon@lineageos.org>
 <ba747c6d-c8a6-438b-efcf-95e24db0a09c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba747c6d-c8a6-438b-efcf-95e24db0a09c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 07/27/2018 10:08 PM, Jacek Anaszewski wrote:
> Hi Simon,
> 
> Thank you for the updated patch. It looks good in general, with
> one reservation, please refer below.

And one more issue:

drivers/leds/leds-an30259a.c: In function 'an30259a_blink_set':
drivers/leds/leds-an30259a.c:129:23: warning: unused variable 'duty' 
[-Wunused-variable]
   unsigned int led_on, duty;
                        ^
BTW, this patch set version should be v4, so please set the next
one to v5.

-- 
Best regards,
Jacek Anaszewski
