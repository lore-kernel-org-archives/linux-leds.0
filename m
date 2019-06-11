From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 0/5] LM36274 Introduction
Date: Tue, 11 Jun 2019 07:17:10 -0500
Message-ID: <d6f3a1d9-5198-917c-8313-ef2036472ce9@ti.com>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <cb41fea8-4cc6-bf0d-8006-6441ba8f2213@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cb41fea8-4cc6-bf0d-8006-6441ba8f2213@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz, broonie@kernel.org, lgirdwood@gmail.com
Cc: lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

Reviewed and tested the updated branch.  Looks good to me.

Dan

On 6/5/19 2:31 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the v6.
>
> Patches 4/5 and 5/5 don't contain amendments I made to
> the respective patches on the ib-leds-mfd-regulator branch
> (that address issues raised by Pavel), so I just kept those
> unchanged. Besides that I updated the remaining ones.
>
> Please check the ib-leds-mfd-regulator branch. I'll create a pull
> request once I get a confirmation from you saying that everything
> is as expected.
>
> Best regards,
> Jacek Anaszewski
>
> On 6/5/19 2:56 PM, Dan Murphy wrote:
>> Hello
>>
>> The v5 patchset missed adding in the new validation code.
>> Patch 1 of the v5 series was squashed into patch 4 of the v5 series.
>> So this will reduce the patchset by 1.
>>
>> Sorry for the extra noise on the patchsets.  The change was lost when 
>> I converted
>> the patches from the mainline branch to the LED branch.
>>
>> This change was made on top of the branch
>>
>> repo: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
>> branch: ti-lmu-led-drivers
>>
>>
>> Dan Murphy (5):
>>    dt-bindings: mfd: Add lm36274 bindings to ti-lmu
>>    mfd: ti-lmu: Add LM36274 support to the ti-lmu
>>    regulator: lm363x: Add support for LM36274
>>    dt-bindings: leds: Add LED bindings for the LM36274
>>    leds: lm36274: Introduce the TI LM36274 LED driver
>>
>>   .../devicetree/bindings/leds/leds-lm36274.txt |  82 +++++++++
>>   .../devicetree/bindings/mfd/ti-lmu.txt        |  54 ++++++
>>   drivers/leds/Kconfig                          |   8 +
>>   drivers/leds/Makefile                         |   1 +
>>   drivers/leds/leds-lm36274.c                   | 174 ++++++++++++++++++
>>   drivers/mfd/Kconfig                           |   5 +-
>>   drivers/mfd/ti-lmu.c                          |  14 ++
>>   drivers/regulator/Kconfig                     |   2 +-
>>   drivers/regulator/lm363x-regulator.c          |  78 +++++++-
>>   include/linux/mfd/ti-lmu-register.h           |  23 +++
>>   include/linux/mfd/ti-lmu.h                    |   4 +
>>   11 files changed, 437 insertions(+), 8 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/leds/leds-lm36274.txt
>>   create mode 100644 drivers/leds/leds-lm36274.c
>>
>
