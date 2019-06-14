From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
Date: Fri, 14 Jun 2019 09:23:33 -0500
Message-ID: <adfe9901-5428-3cd5-32a2-1e9ee3654460@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com> <55737098.K72IVJ5cDM@ada>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55737098.K72IVJ5cDM@ada>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 6/14/19 2:02 AM, Alexander Dahl wrote:
> Hello Dan,
>
> Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
>>    leds: multicolor: Add sysfs interface definition
>>    dt: bindings: Add multicolor class dt bindings documention
>>    documention: leds: Add multicolor class documentation
>>    dt-bindings: leds: Add multicolor ID to the color ID  list
>>    leds: Add multicolor ID to the color ID list
>>    leds: multicolor: Introduce a multicolor class definition
>>    dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>>    leds: lp50xx: Add the LP50XX family of the RGB LED driver
>>    leds: Update the lp55xx to use the multi color framework
> While not having much experience with the implementation of the LED subsystem,
> I've had a short look at those. Curious question: would it be possible to take
> three gpio-leds and group those together to one multicolor-led? I know at
> least one board, where things are wired up like this, see e.g.
> at91-sama5d27_som1_ek.dts

I have been thinking a lot about how gpio LEDs would fit into the mix here.

The leds-gpio.c would need to be extended to register to the multicolor 
framework for this to work.

I would need to get or create a gpio led cluster to test it out.

Dan


> Greets
> Alex
>
