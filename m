From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 0/2] Intel Cherry Trail Whiskey Cove LEDs support
Date: Sun, 10 Feb 2019 01:12:12 +0300
Message-ID: <20190209221213.24052-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

This patch series introduces new driver for controlling LEDs connected
to Intel Cherry Trail Whiskey Cove PMIC (general-purpose LED and charger
status led). Only simple 'always on' and blinking modes are supported
for now, no breathing.

Driver was tested only with Lenovo Yoga Book notebook, and I don't have
any documentation for the PMIC, so proposals and testing are welcome.
