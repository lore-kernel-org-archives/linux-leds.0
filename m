From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/9] leds: multicolor: Add sysfs interface definition
Date: Mon, 27 May 2019 19:45:34 -0500
Message-ID: <522728b0-147b-3708-fea1-88a895491e05@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-2-dmurphy@ti.com> <20190527103355.GA5287@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527103355.GA5287@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

On 5/27/19 5:33 AM, Pavel Machek wrote:
> On Thu 2019-05-23 14:08:12, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..2f102ede258b
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,57 @@
>> +What:		/sys/class/leds/<led>/colors/sync_enable
>> +Date:		April 2019
> I believe I suggested more reasonable interface. Why not use that?
>

Can you please provide the reference to your interface?

These patchsets have been around for a while (Decemeber 2018) and I 
cannot seem to find the reference to your suggestion.

The suggestion may have been mired in the brightness model discussions.

So I don't want to over look what you suggested as it may be more 
reasonable then what I have implemented.

Dan
