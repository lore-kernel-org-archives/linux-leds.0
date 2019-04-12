From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/7] dt: bindings: Add multicolor class dt bindings
 documention
Date: Fri, 12 Apr 2019 13:46:00 -0500
Message-ID: <579add89-e274-07d2-04a4-4998917a62ff@ti.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
 <20190411193848.23140-3-dmurphy@ti.com> <20190412000707.70f8319f@nic.cz>
 <4e22f95f-8658-99cd-145e-b96f9e8314f7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e22f95f-8658-99cd-145e-b96f9e8314f7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Marek Behun <marek.behun@nic.cz>
Cc: robh+dt@kernel.org, pavel@ucw.cz, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 4/12/19 1:14 PM, Jacek Anaszewski wrote:
> Hi Marek,
> 
> On 4/12/19 12:07 AM, Marek Behun wrote:
>> Hi Dan,
>> this probaly was discussed, but I did not follow brightness model
>> discussions:
>> what will happen if I set yellow by writing into yellow mode
>> brightness, and then orange by writing orange model brightness?
>> Will the resulting color be a mix of yellow and orange, or will the
>> orange overwrite the yellow setting?
> 
> Orange will overwrite yellow settings. When color name is given
> it should be treated as a hue. Then changing brightness level
> should affect the lightness of a hue, similarly like changing
> L component of HSL color model. This will be however entirely
> up to DT brightness-model designer how they will design their models.
> We are not going to verify that in the LED multi color class.
> 
> It implies that it will be possible to define arbitrary range
> of color levels, not necessarily adhering to any established color
> model. I think it could be useful to define brightness model
> that allows to go from blue color (for cold) up to red (hot)
> for representing a temperature for instance.
> 
> These ideas will need however more documentation. Generally
> we aim to propose only a convention.
> 

Ah but what about the issue of writing the monochrome LED color.  With your description
it implies that when we write the red LED, the red LED will come on and if we write the blue
LED then the red LED in theory should turn off and the blue come on.

But these could be used to mix the colors to create some abstract violet that is not defined in the brightness
model.  Why should the brightness models and monochrome LEDs have two different operations.

Dan
