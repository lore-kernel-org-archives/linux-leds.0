From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] leds: core: Add led_notify_brightness_change helper
 function
Date: Wed, 19 Oct 2016 15:59:58 +0200
Message-ID: <20161019135958.GE1689@pali>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161019133355.6192-2-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wednesday 19 October 2016 15:33:54 Hans de Goede wrote:
> +		itself and the driver can detect this. Changes done by
> +		kernel triggers / software blinking and writing the brightness
> +		file are not signalled.

Why? In case you have desktop application which show current brightness
level and you change manually it via echo something > /sys/ then that
application does not have any information about your change. And so it
show old value...

-- 
Pali Rohár
pali.rohar@gmail.com
