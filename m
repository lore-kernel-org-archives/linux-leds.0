From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/5] mfd: ti-lmu: Remove support for LM3697
Date: Thu, 4 Apr 2019 07:09:15 -0500
Message-ID: <6ebe491c-f124-2849-2e3a-0209dd5a2620@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-5-dmurphy@ti.com> <20190404081736.GM6830@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404081736.GM6830@dell>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Lee

Thanks for the review

On 4/4/19 3:17 AM, Lee Jones wrote:
> On Mon, 25 Mar 2019, Dan Murphy wrote:
> 
>> Remove support for the LM3697 from the ti-lmu
> 
> Bit of an odd place to insert a line feed.
> 

I will fix in v2.

>> driver in favor of a dedicated LED driver.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  drivers/leds/Kconfig                |  2 +-
>>  drivers/mfd/Kconfig                 |  2 +-
>>  drivers/mfd/ti-lmu.c                | 17 -----------
>>  include/linux/mfd/ti-lmu-register.h | 44 -----------------------------
>>  include/linux/mfd/ti-lmu.h          |  1 -
>>  5 files changed, 2 insertions(+), 64 deletions(-)
> 
> I'm fine with the patch.
> 
> Can you edit drivers/leds/Kconfig as part of a separate patch please?
> Keeping this in sync with this change is not critical and would add a
> whole bunch of process which we can really do without.
> 

Ack.  I will add this when I add the LM3697 config in the Kconfig

Dan

-- 
------------------
Dan Murphy
