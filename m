From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
Date: Mon, 17 Jun 2019 08:47:46 -0500
Message-ID: <2a540277-01e3-abb6-f19f-6d52671ae4ce@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com> <55737098.K72IVJ5cDM@ada>
 <20190616154934.GC24837@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190616154934.GC24837@xo-6d-61-c0.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Alexander Dahl <ada@thorsis.com>
Cc: linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 6/16/19 10:49 AM, Pavel Machek wrote:
> Hi!
>
>> Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
>>>    leds: multicolor: Add sysfs interface definition
>>>    dt: bindings: Add multicolor class dt bindings documention
>>>    documention: leds: Add multicolor class documentation
>>>    dt-bindings: leds: Add multicolor ID to the color ID  list
>>>    leds: Add multicolor ID to the color ID list
>>>    leds: multicolor: Introduce a multicolor class definition
>>>    dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>>>    leds: lp50xx: Add the LP50XX family of the RGB LED driver
>>>    leds: Update the lp55xx to use the multi color framework
>> While not having much experience with the implementation of the LED subsystem,
>> I've had a short look at those. Curious question: would it be possible to take
>> three gpio-leds and group those together to one multicolor-led? I know at
>> least one board, where things are wired up like this, see e.g.
>> at91-sama5d27_som1_ek.dts
> Probably could be done, but is not really a good match. Multicolor was meant for
> LEDs with many brightness levels.

Well that is one aspect of the MC FW.  The other aspect was to collate 
cluster RGB modules into a single

LED node as that RGB cluster would inherently display a functional color 
(ie RGB battery LED, multi-color

notification LEDs, Multicolor LED keyboards...)

Dan


> 									Pavel
