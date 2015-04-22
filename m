From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH 0/2] leds: blink resolution improvements
Date: Wed, 22 Apr 2015 20:02:27 +0300
Message-ID: <5537D423.1040909@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

Hello.

The following patches improve the precision of led
timer trigger and add the resolution control.
That allows to make PWM brightness control with timer
trigger.
