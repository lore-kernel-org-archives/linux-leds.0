From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Add mutex protection in brightness_show()
Date: Wed, 9 Nov 2016 22:23:51 +0100
Message-ID: <b4d76bf3-c973-c12a-23a9-69c6d47d0ffb@gmail.com>
References: <1478245962-15706-1-git-send-email-j.anaszewski@samsung.com>
 <20161109123800.GB3488@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161109123800.GB3488@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: linux-leds@vger.kernel.org

Hi,

On 11/09/2016 01:38 PM, Pavel Machek wrote:
> Hi!
>
>> Initially the claim about no need for lock in brightness_show()
>> was valid as the function was just returning unchanged
>> LED brightness. After the addition of led_update_brightness() this
>
> The claim was probably wrong from the day one, unless brightness is of
> type "atomic_t".
>
>              /* Ensures consistent access to the LED Flash Class device */
> 	        struct mutex            led_access;
> 		};
>
> This should really list fields that are protected by led_access.

Originally it was introduced to facilitate disabling LED subsystem
sysfs interface, i.e. it protects flags property of
struct led_classdev.

-- 
Best regards,
Jacek Anaszewski
