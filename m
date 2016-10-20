From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/2] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Thu, 20 Oct 2016 09:48:43 +0200
Message-ID: <20161020074843.GI1689@pali>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-3-hdegoede@redhat.com>
 <20161019140614.GF1689@pali>
 <10c3baa9-db2f-3cf2-d924-70a77243e7f8@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10c3baa9-db2f-3cf2-d924-70a77243e7f8@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wednesday 19 October 2016 18:09:27 Hans de Goede wrote:
> I agree that this is not pretty, but I could not come up with a
> simple other solution. If you've any suggestions on how you want
> to see this implemented instead I can give that a try.

I was thinking about exporting some dell_wmi_notifier_register and
unregister functions (based on atomic_notifier_chain_register) from
dell-wmi. And dell-laptop could use it. Something similar is already
implemented in dell-rbtn+dell-latop, but still I'm consider it as hack.

This one in dell-wmi could be easier as dell-rbtn because dell-wmi is
monolitic. dell-wmi could be loaded only on systems which support it, so
at that register call (from dell-laptop) you already know if you receive
events or not.

-- 
Pali Rohár
pali.rohar@gmail.com
