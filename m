From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 00/25] Add generic support for composing LED class
 device name
Date: Thu, 4 Apr 2019 21:18:58 +0200
Message-ID: <c1ebb90a-2474-d279-0600-0f6707a7b1a6@gmail.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
 <20190404132157.GB6124@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404132157.GB6124@xo-6d-61-c0.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 4/4/19 3:21 PM, Pavel Machek wrote:
> Hi!
> 
> I have not yet gone through the series in great detail.
> 
> This will change the userland ABI, right? Now, I understand that old ABI is bad, but
> will it break someone's code?

It will not break anyone since the generic support for composing
LED names is used only if struct init_data is provided. Otherwise
led_cdev->name property is taken as is for the LED class device name.

Moreover, it is safe to switch many of existing DT (or fwnode in
general) based drivers to using generic mechanism.
If the DT provides label property it will be concatenated with the
led_hw_name provided by the driver. The problem would be only with
the drivers whose bindings erroneously require devicename section
in the label. They will need to be left intact.

-- 
Best regards,
Jacek Anaszewski
