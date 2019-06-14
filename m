From: Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v3 0/9] Multicolor Framework update
Date: Fri, 14 Jun 2019 09:02:23 +0200
Message-ID: <55737098.K72IVJ5cDM@ada>
References: <20190523190820.29375-1-dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523190820.29375-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello Dan,

Am Donnerstag, 23. Mai 2019, 14:08:11 CEST schrieb Dan Murphy:
>   leds: multicolor: Add sysfs interface definition
>   dt: bindings: Add multicolor class dt bindings documention
>   documention: leds: Add multicolor class documentation
>   dt-bindings: leds: Add multicolor ID to the color ID  list
>   leds: Add multicolor ID to the color ID list
>   leds: multicolor: Introduce a multicolor class definition
>   dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
>   leds: lp50xx: Add the LP50XX family of the RGB LED driver
>   leds: Update the lp55xx to use the multi color framework

While not having much experience with the implementation of the LED subsystem, 
I've had a short look at those. Curious question: would it be possible to take 
three gpio-leds and group those together to one multicolor-led? I know at 
least one board, where things are wired up like this, see e.g. 
at91-sama5d27_som1_ek.dts

Greets
Alex
