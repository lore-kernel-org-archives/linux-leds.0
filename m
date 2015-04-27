From: Stas Sergeev <stsp@list.ru>
Subject: [PATCH v2 0/3] leds: blink resolution improvements
Date: Mon, 27 Apr 2015 20:08:05 +0300
Message-ID: <553E6CF5.4030601@list.ru>
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
timer trigger and add the delay unit control.
That allows to make PWM brightness control with timer
trigger.
