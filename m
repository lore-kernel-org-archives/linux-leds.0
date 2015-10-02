From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: add device trigger
Date: Fri, 02 Oct 2015 16:27:33 +0200
Message-ID: <560E9455.3080800@samsung.com>
References: <cover.1443705827.git.maciek.borzecki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <cover.1443705827.git.maciek.borzecki@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maciek Borzecki <maciek.borzecki@gmail.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

Hi Maciek,

I tested your trigger, and it works fine, but I wonder if
it really improves the things.

Basically, similarly as Josh, I have doubts related to associating
triggers with dev_t. It requires from user to figure out how they can
obtain valid dev_t. For example, in case of v4l2 jpeg codec, I had to
spend some time looking for the location of struct device containing
dev_t related to the exposed encoder and decoder nodes, whereas addition
of debugging instruction should be easy and intuitive.

It is much simpler to register a trigger with human readable names.
What is more, use of dev_t makes the user thinking that there is
some mechanism involved, that automatically associates device with
trigger, and after some time of code investigation one gets
disillusioned and realizes that dev_t is used only to uniquely identify
registered triggers.

I tried to add trigger to the JPEG codec interrupt handler using
ledtrig-oneshot, and below is the result:

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c 
b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 9690f9d..af826d3 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -28,6 +28,7 @@
  #include <media/v4l2-ioctl.h>
  #include <media/videobuf2-core.h>
  #include <media/videobuf2-dma-contig.h>
+#include <linux/leds.h>

  #include "jpeg-core.h"
  #include "jpeg-hw-s5p.h"
@@ -35,6 +36,9 @@
  #include "jpeg-hw-exynos3250.h"
  #include "jpeg-regs.h"

+static unsigned long blink_delay = 30;
+struct led_trigger *jpeg_led_trig;
+
  static struct s5p_jpeg_fmt sjpeg_formats[] = {
         {
                 .name           = "JPEG JFIF",
@@ -2318,6 +2322,7 @@ static irqreturn_t s5p_jpeg_irq(int irq, void *dev_id)
         return IRQ_HANDLED;
  }

+
  static irqreturn_t exynos4_jpeg_irq(int irq, void *priv)
  {
         unsigned int int_status;
@@ -2375,7 +2380,10 @@ static irqreturn_t exynos4_jpeg_irq(int irq, void 
*priv)
         v4l2_m2m_job_finish(jpeg->m2m_dev, curr_ctx->fh.m2m_ctx);
         curr_ctx->subsampling = exynos4_jpeg_get_frame_fmt(jpeg->regs);

+       led_trigger_blink_oneshot(jpeg_led_trig, &blink_delay, 
&blink_delay, 0);
+
         spin_unlock(&jpeg->slock);
+
         return IRQ_HANDLED;
  }

@@ -2589,6 +2597,8 @@ static int s5p_jpeg_probe(struct platform_device 
*pdev)

         v4l2_info(&jpeg->v4l2_dev, "Samsung S5P JPEG codec\n");

+       led_trigger_register_simple("jpeg-trig", &jpeg_led_trig);
+
         return 0;

  enc_vdev_register_rollback:
@@ -2633,6 +2643,8 @@ static int s5p_jpeg_remove(struct platform_device 
*pdev)
         if (!IS_ERR(jpeg->sclk))
                 clk_put(jpeg->sclk);

+       led_trigger_unregister_simple(jpeg_led_trig);
+
         return 0;
  }

It needs addition of 6 lines of code versus 2 lines in case
of ledtrig-device. Not a big deal, taking into account that we
don't have to spend additional time looking for the suitable
struct device.

Please note that in case of drivers that expose many dev nodes,
there are cases like interrupt handlers, where struct device
can't be automatically retrieved, but it needs additional
analysis to find out which dev node given call to ISR referes to.
In this case we would have to check current mode (encoding/decoding)
and call either

	ledtrig_dev_activity(jpeg->vfd_encoder->dev.devt)
or
	ledtrig_dev_activity(jpeg->vfd_decoder->dev.devt).


When comparing the steps required from user space side to activate
the triggers, it looks as follows:


ledtrig-oneshot (we have one trigger for encoding and decoding mode):
=================
#cd /sys/class/leds/aat1290
#cat triggers
#[none] jpeg-trig
#echo "jpeg-trig" > trigger

ledtrig-dev approach (we have to define trigger per dev_t, we choose 
encoder):
=====================
#grep .  /sys/class/video4linux/video*/name
#/sys/class/video4linux/video7/name:s5p-jpeg-enc
#/sys/class/video4linux/video8/name:s5p-jpeg-dec
#ls -l /dev/video7
#crw-rw---T 1 root video 81, 8 Jan  1 03:32 /dev/video8
#echo "81:7" > /sys/kernel/debug/ledtrig-dev/register
#cd /sys/class/leds/aat1290
#cat triggers
#[none] dev-81:7
#echo "dev-81:7" > trigger

It seems that ledtrig-dev is more troublesome in use.

Please let me know if I missed something.

On 10/01/2015 04:04 PM, Maciek Borzecki wrote:
> A series of patches that add yet another LED trigger, a device
> activity trigger.
>
> The motivation is to have a LED trigger that is associated with a
> device and can be fired from cetrain points in the code that have been
> chosen by the developer. With this this device activity trigger it is
> possible for instance to easily hook up a tty driver for a console to
> blink one LED, yet another serial port to blink a second LED and
> writes to a block device to trigger a third LED.
>
> The patches have been tested on Wandboard Quad.
>
> The first patch adds the actual trigger. Each device wishing to use
> the trigger has to be explicitly registered by calling
> ledtrig_dev_add(), and passing it's dev_t. The intention is that the
> trigger will be used in scenarios that are impossible to foresee at
> this moment, and are likely to be approach in a case by case manner
> anyway.
>
> The second patch adds couple of debugfs helpers.
>
> The third patch adds documentation and notes on debugfs interface.
>
> Example hooks into tty driver can be seen here:
> https://github.com/bboozzoo/linux/commit/d8a875673e37b27d9c9066febe7633382f97d8af
>
> Changes since v1:
>    - fixed debugfs user address space access
>    - added unregister debugfs attribute
>    - documentation update
>
> Maciek Borzecki (3):
>    leds: add device activity LED triggers
>    leds: add debugfs to device trigger
>    Documentation: leds: document ledtrig-device trigger
>
>   Documentation/leds/00-INDEX           |   3 +
>   Documentation/leds/ledtrig-device.txt |  35 ++++
>   drivers/leds/trigger/Kconfig          |   8 +
>   drivers/leds/trigger/Makefile         |   1 +
>   drivers/leds/trigger/ledtrig-device.c | 326 ++++++++++++++++++++++++++++++++++
>   include/linux/leds.h                  |  10 ++
>   6 files changed, 383 insertions(+)
>   create mode 100644 Documentation/leds/ledtrig-device.txt
>   create mode 100644 drivers/leds/trigger/ledtrig-device.c
>


-- 
Best Regards,
Jacek Anaszewski
