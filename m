From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/7] dt: bindings: Add multicolor class dt bindings
 documention
Date: Fri, 12 Apr 2019 20:14:42 +0200
Message-ID: <4e22f95f-8658-99cd-145e-b96f9e8314f7@gmail.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
 <20190411193848.23140-3-dmurphy@ti.com> <20190412000707.70f8319f@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412000707.70f8319f@nic.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>, Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, pavel@ucw.cz, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Marek,

On 4/12/19 12:07 AM, Marek Behun wrote:
> Hi Dan,
> this probaly was discussed, but I did not follow brightness model
> discussions:
> what will happen if I set yellow by writing into yellow mode
> brightness, and then orange by writing orange model brightness?
> Will the resulting color be a mix of yellow and orange, or will the
> orange overwrite the yellow setting?

Orange will overwrite yellow settings. When color name is given
it should be treated as a hue. Then changing brightness level
should affect the lightness of a hue, similarly like changing
L component of HSL color model. This will be however entirely
up to DT brightness-model designer how they will design their models.
We are not going to verify that in the LED multi color class.

It implies that it will be possible to define arbitrary range
of color levels, not necessarily adhering to any established color
model. I think it could be useful to define brightness model
that allows to go from blue color (for cold) up to red (hot)
for representing a temperature for instance.

These ideas will need however more documentation. Generally
we aim to propose only a convention.

-- 
Best regards,
Jacek Anaszewski
