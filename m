From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Thinkpad ACPI led -- it keeps blinking
Date: Sat, 27 Apr 2019 18:55:37 +0200
Message-ID: <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190426214246.GA24966@amd>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 4/26/19 11:42 PM, Pavel Machek wrote:
> Hi!
> 
>> Kernel 5.1.0-rc1 + some unrelated bits.
> 
> I tried adding
> https://marc.info/?l=linux-kernel&m=151622365715313&q=raw as Jacek
> suggested, and it is still broken.
> 
> Test code is this: ledtest actually works as expected on first try,
> but keeps blinking on second run. Strange.

Did it work for previous releases? If yes, then bisect should help here.

-- 
Best regards,
Jacek Anaszewski
