From: Raul Piper <raulpblooper@gmail.com>
Subject: Creating sysfs brightness for every led channels
Date: Tue, 6 Sep 2016 00:02:18 +0530
Message-ID: <CAEwN+MAKgvtdB-tgoxzwAZgUk9rUp+YFaCY7qbKk4sg87zdDYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:35682 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932214AbcIEScU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Sep 2016 14:32:20 -0400
Received: by mail-it0-f53.google.com with SMTP id e124so157831826ith.0
        for <linux-leds@vger.kernel.org>; Mon, 05 Sep 2016 11:32:19 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi,
I am trying to send the brightness value ( for 5 channels) by
 echo "val1val2val3val4val5" > brightness ,
But seems like even if I change the brightness type to enum or int in
my driver ,I will never be able to send the brightness string because
led class defines the brightness value as enum.

extern void led_set_brightness(struct led_classdev *led_cdev,
enum led_brightness brightness);

Only possible way I am finding is to create attributes for each
channel like brightness,default trigger,max_brightness and any user
defined attributes, but i am not getting how to do this.
Can some on please comment or post the link to the example driver.
Do i have to call led_class_register for every channel and I have to
define every channel in the device tree?
Thanks in advance !
Regards,
Rp
