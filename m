Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CDDC43463
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 20:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE0E72075E
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 20:31:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgISUbg (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 16:31:36 -0400
Received: from lists.nic.cz ([217.31.204.67]:55186 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbgISUbg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 16:31:36 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 6B05713FDC0;
        Sat, 19 Sep 2020 22:31:34 +0200 (CEST)
Date:   Sat, 19 Sep 2020 22:31:34 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
Message-ID: <20200919223134.2371459c@nic.cz>
In-Reply-To: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 19 Sep 2020 21:24:26 +0200
Adrian Schmutzler <freifunk@adrianschmutzler.de> wrote:

> Many consumer "routers" have dedicated LEDs for specific WiFi bands,
> e.g. one for 2.4 GHz and one for 5 GHz. These LEDs specifically
> indicate the state of the relevant band, so the latter should be
> included in the function name. LED_FUNCTION_WLAN will remain for
> general cases or when the LED is used for more than one band.
> 
> This essentially is equivalent to how we use LED_FUNCTION_LAN and
> LED_FUNCTION_WAN instead of just having LED_FUNCTION_ETHERNET.

Dont. If you want the LED name to inform the user about the WiFi
device it is being triggered on, it instead should come from the
devicename part:
  "wlan0:blue:activity"

In fact the function should not be "wlan" (nor "wlan2g" or "wlan5g", but
"activity".

I am going to try to work on this subsystem so that if trigger source
of the LED is set to a WiFi device and function is set to activity, the
LED shall blink on wifi activity.

This way we can also avoid using the `linux,default-trigger` property
in favour of `function`, i.e. if I have:

   wlan0: wifi@12300 {
     compatible = "some-wifi";
     #trigger-source-cells = <0>;
   }

   led {
     color = <LED_COLOR_ID_BLUE>;
     function = LED_FUNCTION_ACTIVITY;
     trigger-sources = <&wlan0>;
   };

Than this will automatically name the LED as
  wlan0:blue:activity
and if the corresponding trigger is available, it should set the
trigger even if no `linux,default-trigger` property is present.

Marek
