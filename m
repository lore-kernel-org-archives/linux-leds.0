From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 02/24] leds: core: Add support for composing LED class
 device names
Date: Sun, 11 Nov 2018 21:02:58 +0100
Message-ID: <a640167b-3a3e-daea-b377-6e82b653c5e8@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-3-git-send-email-jacek.anaszewski@gmail.com>
 <20181111120234.GA28794@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111120234.GA28794@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 11/11/2018 01:02 PM, Pavel Machek wrote:
> Hi!
> 
>> Add public led_compose_name() API for composing LED class device
>> name basing on fwnode_handle data. The function composes device name
>> according to either a new <color:function> pattern or the legacy
>> <devicename:color:function> pattern. The decision on using the
>> particular pattern is made basing on whether fwnode contains new
>> "function" and "color" properties, or the legacy "label" proeprty.
>>
>> Backwards compatibility with in-driver hard-coded LED class device
>> names is assured thanks to the default_desc argument.
>>
>> In case none of the aformentioned properties was found, then, for OF
>> nodes, the node name is adopted for LED class device name.
>>
> 
>> diff --git a/Documentation/leds/leds-class.txt b/Documentation/leds/leds-class.txt
>> index 836cb16..e9009c4 100644
>> --- a/Documentation/leds/leds-class.txt
>> +++ b/Documentation/leds/leds-class.txt
>> @@ -43,7 +43,7 @@ LED Device Naming
>>  
>>  Is currently of the form:
>>  
>> -"devicename:colour:function"
>> +"colour:function"
>>  
> 
> I don't think we want to do it in all cases.
> 
> So, on my cellphone seeing lp5523:green:led is indeed not useful.
> 
> But on notebook with usb keyboard attached, you need to keep the
> devicename to be able to distinguish capslock on internal keyboard and
> capslock on first USB keyboard and capslock on second USB keyboard.
> 
> Taking look at the list of functions, here's stuff like "hdd" and
> "hdderr". I assume the first means hdd activity... If we can do it, it
> would be nicest to have "sda:green:activity" and maybe
> "sda:red:error". For a raid array with 8 drives...
> 
> For example I have a router running linux. It has 4 lan ports, with
> correspondings LED, and an wan led.
> 
> Having "green:lan1" to "green:lan4" and "green:wan" plus
> "red:wanerror" would work, but I'd really preffer
> "eth0:green:link"... "adsl0:green:link", "adsl0:red:error".
> 
> There are now phones with flashes on both main and selfie
> cameras. Again, knowing which device is which is important. As is
> knowing which display is controlled by particular backlight.

It's overcomplicating the naming again. In every case you can tweak
the function name to eth0_link, eth1_link etc.

-- 
Best regards,
Jacek Anaszewski
