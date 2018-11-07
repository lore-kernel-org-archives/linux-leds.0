From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Wed, 7 Nov 2018 20:28:38 +0100
Message-ID: <e1c7a64d-30ae-c649-fd72-1359d3339d2d@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
 <ee6b35ab-6e26-a5fa-538e-d33b88903330@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ee6b35ab-6e26-a5fa-538e-d33b88903330@ysoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "robh@kernel.org" <robh@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Hi Michal

On 11/07/2018 09:36 AM, Vokáč Michal wrote:
> On 6.11.2018 23:07, Jacek Anaszewski wrote:
>> Add common LED function definitions for use in Device Tree.
>> The function names were extracted from existing dts files
>> after eliminating oddities.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Simon Shields <simon@lineageos.org>
>> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
>> ---
>>   include/dt-bindings/leds/functions.h | 101 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 101 insertions(+)
>>   create mode 100644 include/dt-bindings/leds/functions.h
> 
> Hi Jacek,
> Just nit picking. I think the subject should be:
> 
> "dt-bindings: leds: ..." to be consistent.

Thanks for the heads-up. I'll change it in the v2.

-- 
Best regards,
Jacek Anaszewski
