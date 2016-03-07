From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH 0/7] leds: Use devm_led_classdev_register
Date: Mon, 7 Mar 2016 20:20:47 +0530
Message-ID: <cover.1457355135.git.amitoj1606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
List-Id: linux-leds@vger.kernel.org

Switch to resource-managed function devm_led_classdev_register instead
of led_classdev_register and remove unneeded led_classdev_unregister.

The Coccinelle semantic patch used to make this change is as follows:
//<smpl>
@platform@
identifier p, probefn, removefn;
@@
struct platform_driver p = {
  .probe = probefn,
  .remove = removefn,
};

@prb@
identifier platform.probefn, pdev;
expression e;
@@
probefn(struct platform_device *pdev, ...) {
  ...
  e =
- led_classdev_register
+ devm_led_classdev_register
  (...);
   ...
?- led_classdev_unregister(...);
  ...
}
@remove depends on prb@
identifier platform.removefn;
@@
removefn(...) {
...
?- led_classdev_unregister(...);
...
}
//</smpl>

Amitoj Kaur Chawla (7):
  leds: 88pm860x: Use devm_led_classdev_register
  leds: lp8788: Use devm_led_classdev_register
  leds: wm381x-status: Use devm_led_classdev_register
  leds: s3c24xx: Use devm_led_classdev_register
  leds: da903x: Use devm_led_classdev_register
  leds: max8997: Use devm_led_classdev_register
  leds: lm3533: Use devm_led_classdev_register

 drivers/leds/leds-88pm860x.c      | 11 +----------
 drivers/leds/leds-da903x.c        | 11 +----------
 drivers/leds/leds-lm3533.c        | 12 +++---------
 drivers/leds/leds-lp8788.c        | 12 +-----------
 drivers/leds/leds-max8997.c       | 12 +-----------
 drivers/leds/leds-s3c24xx.c       | 12 +-----------
 drivers/leds/leds-wm831x-status.c | 12 +-----------
 7 files changed, 9 insertions(+), 73 deletions(-)

-- 
1.9.1
