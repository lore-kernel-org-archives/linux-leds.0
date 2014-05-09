From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: "LED / flash API integration" related improvements
Date: Fri, 09 May 2014 16:28:44 +0200
Message-ID: <536CE61C.8010205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19920 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753305AbaEIO2d (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 May 2014 10:28:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5B007C69JHVQ90@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 09 May 2014 15:28:29 +0100 (BST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linux LED Subsystem <linux-leds@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

During review of "LED / flash API integration" patch sets two issues
requiring modifications in the LED subsystem core emerged.
I would like to consult possible ways of solving them:

1.
==================================================================

Some LED devices allow to control multiple LEDs independently.
Currently there is no direct support for this in the LED subsystem
and existing drivers register separate devices for each LED.

LED / flash API integration effort is a good opportunity to provide
support for exposing multiple LEDs by a single LED class device.

I would like to add following API:

/**
  * led_get_sub_leds_number - get the number of exposed LEDs
  * @led_cdev: the LED to query
  * @num_leds: number of exposed leds
  *
  * Get the number of leds exposed by the device.
  *
  * Returns: 0 on success or negative error value on failure
  */
int led_get_sub_leds_number(struct led_classdev *led_cdev,
                         int *num_leds);

/**
  * led_select_sub_led - select sub led to control
  * @led_cdev: the LED to set
  * @led_id: id of the sub led to control
  *
  * Set the sub led to be the target of the LED class API calls.
  * Maximum led_id equals num_leds - 1.
  *
  * Returns: 0 on success or negative error value on failure
  */
int led_select_sub_led(struct led_classdev *led_cdev,
                     int led_id);

/**
  * led_get_sub_led - get currently selected sub led
  * @led_cdev: the LED to set
  * @led_id: id of currently selected sub led
  *
  * Get id of the sub led chosen as the target of LED class
  * API calls. Maximum led_id equals num_leds - 1.
  *
  * Returns: 0 on success or negative error value on failure
  */
int led_get_target_led(struct led_classdev *led_cdev,
                         int* led_id);

The functions functions would be mapped on the sysfs attributes:
- available_leds - RO
- sub_led_id - RW

The attributes would be created only if the related callbacks
are registered by the driver.

2.
==================================================================

The second issue, refers to the work queues being used in the
brightness_set callbacks of the LED subsystem drivers. It interferes
with the way how V4L2 Flash controls work, which expect that setting
flash brightness has immediate effect.

Proposed solutions:
- move work queues out from the drivers to the LED core.
- add brightness_set_now callback to be registered by
   the LED drivers and intended for call by v4l2-flash driver;
   it wouldn't schedule a work but do the job immediately

==================================================================

I'd be glad to hear any comments on this.

Thanks,
Jacek Anaszewski
