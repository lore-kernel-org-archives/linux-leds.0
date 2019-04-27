From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Sat, 27 Apr 2019 22:35:35 +0200
Message-ID: <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190427193411.GA9709@amd>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 4/27/19 9:34 PM, Pavel Machek wrote:
> On Sat 2019-04-27 18:55:37, Jacek Anaszewski wrote:
>> On 4/26/19 11:42 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> Kernel 5.1.0-rc1 + some unrelated bits.
>>>
>>> I tried adding
>>> https://marc.info/?l=linux-kernel&m=151622365715313&q=raw as Jacek
>>> suggested, and it is still broken.
>>>
>>> Test code is this: ledtest actually works as expected on first try,
>>> but keeps blinking on second run. Strange.
>>
>> Did it work for previous releases? If yes, then bisect should help here.
> 
> Absolutely no idea :-(. I assume "no". Capslock LED on the same system
> works as expected.
> 
> I still hope thinkpad people will speak up, notice it does not work
> for them, and debug it :-).

I see this driver implements blink_set:

tpacpi_leds[led].led_classdev.blink_set = &led_sysfs_blink_set;

and also applies some internal logic related to the type
of supported LEDs, and the way how the hardware is accessed.

To eliminate the problem on the LED core side you could
disable initialization of blink_set op in the driver.

-- 
Best regards,
Jacek Anaszewski
