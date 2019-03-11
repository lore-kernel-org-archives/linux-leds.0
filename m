From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Mon, 11 Mar 2019 18:22:54 +0100
Message-ID: <cf26b351-f2b5-8345-29b7-401153b5f0d7@gmail.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
 <20190307220947.20057-4-dmurphy@ti.com>
 <8ac4d84f-c792-893d-fbae-fac88fac8631@gmail.com>
 <bb621d08-c192-0018-f67e-3f3262a71b6f@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb621d08-c192-0018-f67e-3f3262a71b6f@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

One more thing I forgot to mention before.

On 3/11/19 12:36 PM, Dan Murphy wrote:
> Jacek
[...]
> 
>>> @@ -0,0 +1,72 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/* TI LM3532 LED driver
>>> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>>> + */

Let's have "//" comments here.

>>> +#ifndef __DT_BINDINGS_LEDS_LM3532_H
>>> +#define __DT_BINDINGS_LEDS_LM3532_H
>>> +
>>> +#define LM3532_BL_MODE_MANUAL    0x00 /* "man" */
>>> +#define LM3532_BL_MODE_ALS    0x01 /* "als" */
>>> +
>>> +/* ALS Resistor Select */
>>> +#define LM3532_IMP_HIGH        0x00
>>> +#define LM3532_IMP_37K        0x01
>>> +#define LM3532_IMP_18_5K    0x02
>>> +#define LM3532_IMP_12_33K    0x03
>>> +#define LM3532_IMP_9_25K    0x04
>>> +#define LM3532_IMP_7_4K        0x05
>>> +#define LM3532_IMP_6_17K    0x06
>>> +#define LM3532_IMP_5_29K    0x07
>>> +#define LM3532_IMP_4_63K    0x08
>>> +#define LM3532_IMP_4_11K    0x09
>>> +#define LM3532_IMP_3_7K        0x0a
>>> +#define LM3532_IMP_3_36K    0x0b
>>> +#define LM3532_IMP_3_08K    0x0c
>>> +#define LM3532_IMP_2_85K    0x0d
>>> +#define LM3532_IMP_2_64K    0x0e
>>> +#define LM3532_IMP_2_44K    0x0f
>>> +#define LM3532_IMP_2_31K    0x10
>>> +#define LM3532_IMP_2_18K    0x11
>>> +#define LM3532_IMP_2_06K    0x12
>>> +#define LM3532_IMP_1_95K    0x13
>>> +#define LM3532_IMP_1_85K    0x14
>>> +#define LM3532_IMP_1_76K    0x15
>>> +#define LM3532_IMP_1_68K    0x16
>>> +#define LM3532_IMP_1_61K    0x17
>>> +#define LM3532_IMP_1_54K    0x18
>>> +#define LM3532_IMP_1_48K    0x19
>>> +#define LM3532_IMP_1_42K    0x1a
>>> +#define LM3532_IMP_1_37K    0x1b
>>> +#define LM3532_IMP_1_32K    0x1c
>>> +#define LM3532_IMP_1_28K    0x1d
>>> +#define LM3532_IMP_1_23K    0x1e
>>> +#define LM3532_IMP_1_19K    0x1f
>>> +
>>> +/* ALS Averaging Time */
>>> +#define LM3532_ALS_AVRG_TIME_17_92ms    0x00
>>> +#define LM3532_ALS_AVRG_TIME_35_84ms    0x01
>>> +#define LM3532_ALS_AVRG_TIME_71_68ms    0x02
>>> +#define LM3532_ALS_AVRG_TIME_143_36ms    0x03
>>> +#define LM3532_ALS_AVRG_TIME_286_72ms    0x04
>>> +#define LM3532_ALS_AVRG_TIME_573_44ms    0x05
>>> +#define LM3532_ALS_AVRG_TIME_1146_88ms    0x06
>>> +#define LM3532_ALS_AVRG_TIME_2293_76ms    0x07
>>> +
>>> +/* ALS input select */
>>> +#define LM3532_ALS_INPUT_AVRG    0x00 /* ALS1 and ALS2 input average */
>>> +#define LM3532_ALS_INPUT_ALS1    0x01 /* ALS1 Input */
>>> +#define LM3532_ALS_INPUT_ALS2    0x02 /* ALS2 Input */
>>> +#define LM3532_ALS_INPUT_CEIL    0x03 /* Max of ALS1 and ALS2 */
>>> +
>>> +/* Ramp Times */
>>> +#define LM3532_RAMP_8us        0x00
>>> +#define LM3532_RAMP_1024us    0x01
>>> +#define LM3532_RAMP_2048us    0x02
>>> +#define LM3532_RAMP_4096us    0x03
>>> +#define LM3532_RAMP_8192us    0x04
>>> +#define LM3532_RAMP_16384us    0x05
>>> +#define LM3532_RAMP_32768us    0x06
>>> +#define LM3532_RAMP_65536us    0x07
>>> +
>>> +#endif /* __DT_BINDINGS_LEDS_LM3532_H */
>>>
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
