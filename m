From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 3/3] backlight: lm3630a: add device tree supprt
Date: Tue, 2 Apr 2019 12:07:22 -0500
Message-ID: <6717928c-0531-cc36-d22b-a53cc359fb97@ti.com>
References: <20190401103034.21062-1-masneyb@onstation.org>
 <20190401103034.21062-4-masneyb@onstation.org>
 <7bcd94ee-a4f8-c91b-697d-cc4c6337ec88@ti.com> <20190402164533.GA21197@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402164533.GA21197@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Brian Masney <masneyb@onstation.org>, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org, jacek.anaszewski@gmail.com, mark.rutland@arm.com, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, jonathan@marek.ca
List-Id: linux-leds@vger.kernel.org

On 4/2/19 11:45 AM, Pavel Machek wrote:
> On Tue 2019-04-02 08:45:40, Dan Murphy wrote:
>> Hello
>>
>> On 4/1/19 5:30 AM, Brian Masney wrote:
>>> Add device tree support to the lm3630a driver and allow configuring
>>> independently on both banks the mapping mode (linear or exponential),
>>> initial and maximum LED brightness.
>>>
>>> Driver was tested on a LG Nexus 5 (hammerhead) phone.
>>>
>>
>> Don't need this in the commit message.
> 
> Actually yes, we want that in commit message.
> 

Noted for future patches.

Dan

> 									Pavel
> 


-- 
------------------
Dan Murphy
