From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Tue, 11 Aug 2015 19:42:56 +0200
Message-ID: <20150811194256.08816c63@x2>
References: <20150805220948.3984f19c@x2>
	<20150806165924.GY1540@lahna.fi.intel.com>
	<20150806191727.0bf87a3a@x2>
	<20150806173558.GZ1540@lahna.fi.intel.com>
	<20150806201820.5ca0764d@x2>
	<20150807105745.GB1540@lahna.fi.intel.com>
	<20150808140656.6b81d3b9@x2>
	<20150811120038.GF1541@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20150811120038.GF1541@lahna.fi.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 11 Aug 2015 15:00:38 +0300, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> One thing I noticed:
> 
> 	qnap_tsx51_leds_platform_device = platform_device_register_resndata(NULL, "led-gpio", -1, NULL, 0,
> 		&qnap_tsx51_led_data, sizeof(qnap_tsx51_led_data));
> 
> The driver expects "leds-gpio" not "led-gpio".

And indeed, this is what was preventing proper detection.
Very nice catch, thanks a lot.

Now, I see two more things I need to do and for which I have no idea:
- Somehow depend on gpio-f7188x and cause leds-gpio to get loaded (is it
  a dependence too ?).
  Module writing documentation mention soft dependencies, but it feels
  wrong here.
- Somehow detect that it is actually a qnap of expected model (and, by
  extension, actually implement led count substraction).
  I tried (and failed so far) to understand what the original firmware
  does. dmidecode does not bring something relevant. I have no idea
  what is typically done in this area.

Regards,
-- 
Vincent Pelletier
