From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Fri, 8 Mar 2019 07:28:19 -0600
Message-ID: <f618b1dc-abf2-88ba-9b73-1a70471adc6b@ti.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
 <20190307220947.20057-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307220947.20057-4-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 3/7/19 4:09 PM, Dan Murphy wrote:
> Introduce the Texas Instruments LM3532 White LED driver.
> The driver supports ALS configurability or manual brightness
> control.
> 
> The driver also supports associating LED strings with specific
> control banks in a group or as individually controlled strings.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                   |  10 +
>  drivers/leds/Makefile                  |   1 +
>  drivers/leds/leds-lm3532.c             | 595 +++++++++++++++++++++++++
>  include/dt-bindings/leds/leds-lm3532.h |  72 +++
>  4 files changed, 678 insertions(+)
>  create mode 100644 drivers/leds/leds-lm3532.c
>  create mode 100644 include/dt-bindings/leds/leds-lm3532.h
> 

After thinking about this dt header I am not happy about having it.
I am thinking of removing this file completely and doing some calculations in the driver
file for the impedance, averaging time and ramp times.

I would still like to get comments on the rest of the code but in v2 the dt bindings header will
go away.

Dan

<snip>
-- 
------------------
Dan Murphy
