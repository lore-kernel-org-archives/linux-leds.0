From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Thu, 14 Feb 2019 11:04:44 +0100
Message-ID: <079efdd4-2259-1e6f-48dd-5876f2bd7a93@redhat.com>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 13-02-19 23:43, Hans de Goede wrote:
> Hi,
> 
> On 12-02-19 21:59, Yauhen Kharuzhy wrote:
>> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
>> PMIC. Charger and general-purpose leds are supported. Hardware blinking
>> is implemented, breathing is not.
>>
>> This driver was tested with Lenovo Yoga Book notebook.

<snip>

> Note that in my experience the "charging" mode only works
> when bits 0-1 have the value 10.

Ok, scrap that I don't know where this info in my notes
came from (probably user error), the power-on-reset
value for bits 0-1 is 00 and then the hw controls the
charging LED just fine. So your code is right, bit 0
switches between hw-control (0) and user-control (1) and
bit 1 is on/off when user-control is enabled.

Regards,

Hans
