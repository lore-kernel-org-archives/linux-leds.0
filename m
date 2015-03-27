From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v2] leds: start numerating duplicated devices from 2
Date: Fri, 27 Mar 2015 08:51:01 +0100
Message-ID: <CAPybu_1U7U04AKx3TF65PRw5KBLmp2uOJK3mn6mV=rup5m031w@mail.gmail.com>
References: <1427381989-17365-1-git-send-email-j.anaszewski@samsung.com> <CAK5ve-JVeosdk+c7QsGqGWskNHvrpKbGn--LfGGOzwyROwDk0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:36583 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752683AbbC0HvX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Mar 2015 03:51:23 -0400
Received: by labe2 with SMTP id e2so64087994lab.3
        for <linux-leds@vger.kernel.org>; Fri, 27 Mar 2015 00:51:22 -0700 (PDT)
In-Reply-To: <CAK5ve-JVeosdk+c7QsGqGWskNHvrpKbGn--LfGGOzwyROwDk0w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>

Hello Bryan

On Thu, Mar 26, 2015 at 7:15 PM, Bryan Wu <cooloney@gmail.com> wrote:
> No, I prefer to "_1" since normally we treat the first one "_0" or
> empty. But I suggest we add the "_0" for the first new device then the
> second one will be "_1"

Wouldn't that break the userspace API? perhaps there is a script/app
is using the legacy name.

What about leaving the legacy file, but adding a symbolic link from
name_0 to name?

Regards!
